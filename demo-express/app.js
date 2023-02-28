import express from 'express';

const app = express();

app.get('/status', (req, res) => {
  return res.json({
    alive: true,
  });
});

app.get('/dad-joke', async (req, res) => {
  const apiRes = await fetch('https://icanhazdadjoke.com', {
    headers: {
      accept: 'application/json',
    },
  });
  const jokeJson = await apiRes.json();

  return res.json(jokeJson);
});

app.listen(8080, '0.0.0.0', () => {
  console.log(`🚀 Server ready at http://0.0.0.0:8080!`);
});
