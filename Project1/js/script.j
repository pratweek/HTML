document.addEventListener("DOMContentLoaded", () => {
  console.log("Swiggy-style website loaded 🍔");

  // Smooth fade-in for hero text + search
  const fadeElements = document.querySelectorAll("main section:first-child p, main section:first-child input");
  fadeElements.forEach((el, i) => {
    setTimeout(() => {
      el.classList.add("fade-in");
    }, i * 500);
  });

  // Input focus glow effect
  const searchBox = document.querySelector("main section:first-child input");
  if (searchBox) {
    searchBox.addEventListener("focus", () => {
      searchBox.style.boxShadow = "0px 0px 12px 3px rgba(255,102,0,0.6)";
    });
    searchBox.addEventListener("blur", () => {
      searchBox.style.boxShadow = "0px 4px 10px rgba(0,0,0,0.3)";
    });
  }

  // Animate feature cards when they come into view
  const cards = document.querySelectorAll(".feature-card");
  const observer = new IntersectionObserver(entries => {
    entries.forEach(entry => {
      if (entry.isIntersecting) {
        entry.target.classList.add("fade-in");
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.2 });

  cards.forEach(card => observer.observe(card));
});

