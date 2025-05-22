document.addEventListener("DOMContentLoaded", () => {
    const replyLinks = document.querySelectorAll(".reply-link");
    const replyForm = document.getElementById("reply-form");
    const parentField = replyForm?.querySelector("input[name='review[parent_id]']");
  
    if (!replyForm || !parentField) return;
  
    replyLinks.forEach(link => {
      link.addEventListener("click", event => {
        event.preventDefault();
        const reviewId = link.dataset.replyTo;
        const container = link.closest(".review_container");
        container.appendChild(replyForm);
        replyForm.style.display = "block";
        parentField.value = reviewId;
      });
    });
  });