// backend-selector-server.js
const express = require('express');
const bodyParser = require('body-parser');
const fs = require('fs');
const path = require('path');
const app = express();
const PORT = process.env.PORT || 3000;

// Middleware
app.use(bodyParser.json());
app.use(express.static('public'));

// Serve the backend selector HTML
app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'public', 'backend-selector.html'));
});

// Endpoint to serve available backends
app.get('/available-backends.txt', (req, res) => {
  try {
    const backends = fs.readFileSync(path.join(__dirname, 'data', 'available-backends.txt'), 'utf8');
    res.type('text/plain').send(backends);
  } catch (error) {
    console.error('Error reading available backends:', error);
    res.status(500).send('Error loading available backends');
  }
});

// Endpoint to serve current selection
app.get('/selected-backend.txt', (req, res) => {
  try {
    const selection = fs.readFileSync(path.join(__dirname, 'data', 'selected-backend.txt'), 'utf8');
    res.type('text/plain').send(selection);
  } catch (error) {
    console.error('Error reading selected backend:', error);
    res.status(500).send('Error loading selected backend');
  }
});

// API endpoint to save the backend selection
app.post('/api/save-backend', (req, res) => {
  try {
    const { backend } = req.body;
    
    if (!backend) {
      return res.status(400).json({ success: false, message: 'No backend specified' });
    }
    
    // Save to both files - the selected-backend.txt for current state
    // and save-backend.txt for CircleCI to pick up
    fs.writeFileSync(path.join(__dirname, 'data', 'selected-backend.txt'), backend);
    fs.writeFileSync(path.join(__dirname, 'data', 'save-backend.txt'), backend);
    
    console.log(`Backend selection saved: ${backend}`);
    
    return res.json({ 
      success: true, 
      message: 'Backend selection saved successfully' 
    });
  } catch (error) {
    console.error('Error saving backend selection:', error);
    return res.status(500).json({ 
      success: false, 
      message: `Error saving selection: ${error.message}` 
    });
  }
});

// Start the server
app.listen(PORT, () => {
  console.log(`Backend selector server running on port ${PORT}`);
});