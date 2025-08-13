#!/usr/bin/env node

import title from "title";

// Get the input string from command-line arguments
const input = process.argv.slice(2).join(" ");

if (!input) {
  console.error("❌ Please provide a string to convert.");
  process.exit(1);
}

// Step 1: Convert to Title Case
const titleCase = title(input);

// Step 2: Replace spaces and non-alphanumeric with underscores (preserve capitalization)
const snakeTitleCase = titleCase
  .replace(/[^A-Za-z0-9]+/g, "_") // Replace spaces & punctuation with underscores
  .replace(/^_+|_+$/g, ""); // Remove leading/trailing underscores

// Output the final result
console.log(snakeTitleCase);
