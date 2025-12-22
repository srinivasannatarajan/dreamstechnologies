const fs = require("fs");
const path = require("path");

console.log("Building application...");

// Create dist directory
const distDir = path.join(__dirname, "dist");
if (!fs.existsSync(distDir)) {
  fs.mkdirSync(distDir, { recursive: true });
}

// Read source files
const indexHtml = fs.readFileSync(
  path.join(__dirname, "src", "index.html"),
  "utf8"
);
const appJs = fs.readFileSync(path.join(__dirname, "src", "app.js"), "utf8");
const stylesCss = fs.readFileSync(
  path.join(__dirname, "src", "styles.css"),
  "utf8"
);

// Write to dist with optimization (minification simulation)
fs.writeFileSync(path.join(distDir, "index.html"), indexHtml);
fs.writeFileSync(path.join(distDir, "app.js"), appJs);
fs.writeFileSync(path.join(distDir, "styles.css"), stylesCss);

console.log(" Build completed successfully!");
console.log(" Files written to dist/");
console.log("  - index.html");
console.log("  - app.js");
console.log("  - styles.css");
