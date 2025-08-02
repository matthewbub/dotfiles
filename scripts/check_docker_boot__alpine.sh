#!/bin/sh

# Exit immediately if a command exits with a non-zero status.
set -e

# Renamed variables for clarity
DOCKER_SERVICE_NAME="docker"
BOOT_RUNLEVEL_DIR="/etc/runlevels/boot/"
INIT_D_SCRIPTS_DIR="/etc/init.d/"
DOCKERD_PROCESS_NAME="dockerd" # The actual daemon executable name

echo "--- Running Docker Status Checks ---"

# Function to check OpenRC boot configuration
check_boot_config() {
    echo "Checking OpenRC boot configuration for Docker..."

    if [ ! -d "$BOOT_RUNLEVEL_DIR" ]; then
        echo "Error: Runlevel directory '$BOOT_RUNLEVEL_DIR' does not exist."
        exit 1
    fi

    if [ ! -f "${INIT_D_SCRIPTS_DIR}${DOCKER_SERVICE_NAME}" ]; then
        echo "Error: Docker service script '${INIT_D_SCRIPTS_DIR}${DOCKER_SERVICE_NAME}' not found."
        echo "This might indicate Docker is not fully installed or its service script is missing."
        exit 1
    fi

    ls -l "$BOOT_RUNLEVEL_DIR" | grep -q "${DOCKER_SERVICE_NAME} -> ${INIT_D_SCRIPTS_DIR}${DOCKER_SERVICE_NAME}"

    if [ $? -eq 0 ]; then
        echo "SUCCESS: Docker is configured to start on boot via OpenRC."
        echo "Symbolic link found: ${BOOT_RUNLEVEL_DIR}${DOCKER_SERVICE_NAME} -> ${INIT_D_SCRIPTS_DIR}${DOCKER_SERVICE_NAME}"
        return 0 # Success for this function
    else
        echo "WARNING: Docker is NOT configured to start on boot via OpenRC."
        echo "Expected symbolic link '${BOOT_RUNLEVEL_DIR}${DOCKER_SERVICE_NAME} -> ${INIT_D_SCRIPTS_DIR}${DOCKER_SERVICE_NAME}' not found."
        echo "You might need to run: rc-update add docker boot"
        return 1 # Failure for this function
    fi
}

# Function to check Docker daemon runtime status
check_daemon_status() {
    echo "Verifying Docker daemon process status..."
    if pidof "$DOCKERD_PROCESS_NAME" > /dev/null; then
        echo "SUCCESS: Docker daemon ('$DOCKERD_PROCESS_NAME') is currently running."
        return 0 # Success for this function
    else
        echo "ERROR: Docker daemon ('$DOCKERD_PROCESS_NAME') does not appear to be running."
        echo "This could mean 'service docker start' failed, or the daemon crashed."
        echo "You may need to investigate issues or check logs."
        return 1 # Failure for this function
    fi
}

# --- Main execution flow ---
check_boot_config
# If check_boot_config returns 1, `set -e` will cause the script to exit here.
# Otherwise, continue to the next check.

check_daemon_status
# If check_daemon_status returns 1, `set -e` will cause the script to exit here.
# Otherwise, the script completes successfully.

echo "--- All Docker checks passed successfully ---"
exit 0 # Explicitly exit with success if all functions returned 0
