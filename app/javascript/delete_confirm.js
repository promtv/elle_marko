document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("delete-clothing-form");
    if (form) {
      form.addEventListener("submit", function (event) {
        if (!confirm("Are you sure?")) {
          event.preventDefault();
        }
      });
    }
  });