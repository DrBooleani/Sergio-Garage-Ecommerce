import express from 'express';

const app = express();

app.set('view engine', 'pug');
app.use(express.static('public'));

app.use('/', (req, res) => {
  res.render('index');
});

app.listen(3000, () => {
  console.log(`[Sergio Admin] Listening on 3000`);
});