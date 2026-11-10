// Define custom error class
class InvalidUserInputError extends Error {
  constructor(message: string) {
    super(message);
    this.name = "InvalidUserInputError";
  }
}
(window as any).InvalidUserInputError = InvalidUserInputError;

// Interface and collection setup
interface FlashCard {
  questionText: string;
  questionAnswer: string;
}

const currentCards: FlashCard[] = [
  {
    questionText: "What is TypeScript?",
    questionAnswer: "A typed superset of JavaScript."
  },
  {
    questionText: "What is the DOM?",
    questionAnswer: "Document Object Model"
  }
];

let currentIndex = 0;

// DOM Elements
const flashcardEl = document.getElementById("flashcard");
const deleteBtn = document.getElementById("delete-btn");
const entryForm = document.getElementById("entry-form") as HTMLFormElement;
const frontText = document.getElementById("front-text") as HTMLTextAreaElement;
const backText = document.getElementById("back-text") as HTMLTextAreaElement;

// Display function
function displayCurrentCard() {
  if (!flashcardEl) return;

  if (currentCards.length === 0) {
    flashcardEl.textContent = "No cards available";
    return;
  }

  const card = currentCards[currentIndex];
  flashcardEl.innerHTML = `
    <div>${card.questionText}</div>
    <div>${card.questionAnswer}</div>
  `;
}

// Test 6: Click handler to add the flipped class
if (flashcardEl) {
  flashcardEl.addEventListener("click", () => {
    flashcardEl.classList.add("flipped");
  });
}

// Test 9: Delete current card and display the previous card data
if (deleteBtn) {
  deleteBtn.addEventListener("click", () => {
    if (currentCards.length === 0) return;

    currentCards.splice(currentIndex, 1);

    if (currentCards.length > 0) {
      currentIndex = (currentIndex - 1 + currentCards.length) % currentCards.length;
    } else {
      currentIndex = 0;
    }

    if (flashcardEl) {
      flashcardEl.classList.remove("flipped");
    }
    displayCurrentCard();
  });
}

// Test 12: Validation function throwing InvalidUserInputError
function validateCardInput(questionText: string, questionAnswer: string): void {
  if (!questionText || !questionText.trim() || !questionAnswer || !questionAnswer.trim()) {
    throw new InvalidUserInputError("Question and answer cannot be empty.");
  }
}
(window as any).validateCardInput = validateCardInput;

// Form submit handler
if (entryForm && frontText && backText) {
  entryForm.addEventListener("submit", (e) => {
    e.preventDefault();

    validateCardInput(frontText.value, backText.value);

    const newCard: FlashCard = {
      questionText: frontText.value,
      questionAnswer: backText.value
    };

    currentCards.push(newCard);
    currentIndex = currentCards.length - 1;
    displayCurrentCard();

    entryForm.reset();
  });
}

// Initial render call
displayCurrentCard();