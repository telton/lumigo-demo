import fastify from 'fastify';

const app = fastify();

app.get('/status', async (req, reply) => {
  return {
    alive: true,
  };
});

app.get('/dad-joke', async (req, reply) => {
  const apiRes = await fetch('https://icanhazdadjoke.com', {
    headers: {
      accept: 'application/json',
    },
  });
  const jokeJson = await apiRes.json();

  return jokeJson;
});

app.listen({ host: '0.0.0.0', port: 8080 }, () => {
  console.log(`🚀 Server ready at http://0.0.0.0:8080!`);
});
