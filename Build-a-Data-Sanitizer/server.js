// build-a-data-sanitizer/server.js

const express = require('express');
const path = require('path');
const { inputCleaner, inputValidator } = require('./middleware');

const app = express();
const PORT = 3000;

// Middleware
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// 1. GET / MUST come before express.static so it handles the redirect properly
app.get('/', (req, res) => {
  res.redirect(302, '/form'); // Explicitly setting status code 302 can help certain test suites
});

// 2. Serve static files from public directory
app.use(express.static(path.join(__dirname, 'public')));

// 3. GET /form route
app.get('/form', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'index.html'));
});

// 4. POST /submit route with middleware sequence
app.post('/submit', inputCleaner, inputValidator, (req, res) => {
  const { username, comment } = req.body;
  res.send(`Sanitized Username: ${username}, Comment: ${comment}`);
});

// Only start the server if not required by a test framework (like Supertest/Mocha)
if (process.env.NODE_ENV !== 'test') {
  app.listen(PORT, () => {
    console.log(`Server is listening on port ${PORT}`);
  });
}

module.exports = app;