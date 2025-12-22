// Simple JavaScript for the Node.js Multi-Stage Build Demo

document.addEventListener("DOMContentLoaded", function () {
  // Set build date
  const buildDate = document.getElementById("buildDate");
  if (buildDate) {
    buildDate.textContent = new Date().toLocaleString();
  }

  // Animate stats on load
  animateStats();

  // Add interactive hover effects
  addInteractiveEffects();
});

function animateStats() {
  const stats = document.querySelectorAll(".stat");
  stats.forEach((stat, index) => {
    setTimeout(() => {
      stat.style.opacity = "0";
      stat.style.transform = "translateY(20px)";

      setTimeout(() => {
        stat.style.transition = "all 0.5s ease";
        stat.style.opacity = "1";
        stat.style.transform = "translateY(0)";
      }, 50);
    }, index * 100);
  });
}

function addInteractiveEffects() {
  // Add click animation to stages
  const stages = document.querySelectorAll(".stage");
  stages.forEach((stage) => {
    stage.addEventListener("click", function () {
      this.style.transform = "scale(0.95)";
      setTimeout(() => {
        this.style.transform = "scale(1)";
      }, 150);
    });
  });

  // Add hover effect to benefits
  const benefits = document.querySelectorAll(".benefit");
  benefits.forEach((benefit) => {
    benefit.addEventListener("mouseenter", function () {
      this.querySelector(".icon").style.transform = "scale(1.2) rotate(10deg)";
    });

    benefit.addEventListener("mouseleave", function () {
      this.querySelector(".icon").style.transform = "scale(1) rotate(0deg)";
    });
  });
}

// Log build information
console.log(
  "%c Multi-Stage Docker Build Demo ",
  "background: #667eea; color: white; font-size: 16px; padding: 10px;"
);
console.log("Built with Node.js and served by Nginx");
console.log("Dreams Technologies DevOps Assignment");
