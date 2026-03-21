const express = require("express");
const { v4: uuidv4 } = require("uuid");
const path = require("path");

const app = express();
const PORT = 3000;

app.use(express.json());
app.use(express.static(path.join(__dirname, "public")));

let notes = [];

app.get("/notes", (req, res) => {
  res.json(notes);
});

app.post("/notes", (req, res) => {
  const { title, content } = req.body;

  const note = {
    id: uuidv4(),
    title,
    content
  };

  notes.push(note);
  res.status(201).json(note);
});

app.delete("/notes/:id", (req, res) => {
  const { id } = req.params;

  notes = notes.filter(n => n.id !== id);

  res.json({ message: "Deleted" });
});

app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

app.listen(PORT, () => {
  console.log("Notes app running on port 3000");
});
