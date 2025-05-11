document.addEventListener("DOMContentLoaded", function () {
    const input = document.getElementById("search-input");
    const suggestions = document.getElementById("search-suggestions");
  
    if (!input || !suggestions) return;
  
    let timer;
  
    input.addEventListener("input", function () {
      const query = input.value.trim();
  
      clearTimeout(timer);
      if (query.length < 2) {
        suggestions.innerHTML = "";
        return;
      }
  
      timer = setTimeout(() => {
        fetch(`/clothings/autocomplete?q=${encodeURIComponent(query)}`)
          .then((res) => res.json())
          .then((data) => {
            suggestions.innerHTML = "";
            data.forEach((item) => {
              const div = document.createElement("div");
              div.innerHTML = `<a href="/clothings/${item.id}" style="display:block; padding: 5px;">${item.name} (${item.brand})</a>`;
              suggestions.appendChild(div);
            });
          });
      }, 300);
    });
  
    document.addEventListener("click", (e) => {
      if (!document.getElementById("search-container").contains(e.target)) {
        suggestions.innerHTML = "";
      }
    });
  });