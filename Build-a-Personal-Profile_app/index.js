const express = require('express');
const app = express();
const port = 3000;

// 2. GET route for the root path '/'
app.get('/', (req, res) => {
  res.send("Welcome to Camper Bot's homepage!");
});

// 3. GET route for the '/hobbies' path
app.get('/hobbies', (req, res) => {
  res.send('I cycle, go boating, and play guitar.');
});

// 4. GET route for the '/skills' path
app.get('/skills', (req, res) => {
  res.send('JavaScript, Node.js, and Express.js!');
});

// 5. GET route for the '/api/profile' path sending JSON
app.get('/api/profile', (req, res) => {
  res.json({
    name: 'Camper Bot',
    hobbies: ['cycling', 'boating', 'guitar'],
    skills: ['JavaScript', 'Node.js', 'Express.js']
  });
});

// 1. Start the server listening on port 3000
app.listen(port, () => {
  console.log(`Server is listening on port ${port}`);
});