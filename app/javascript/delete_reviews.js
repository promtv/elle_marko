document.addEventListener("DOMContentLoaded", function () {
    document.querySelectorAll(".delete-review-form").forEach(function (form) {
      form.addEventListener("submit", function (event) {
        if (!confirm("Are you sure you want to delete this review?")) {
          event.preventDefault();
        }
      });
    });
  });