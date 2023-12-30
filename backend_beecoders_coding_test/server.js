import express from 'express';
import morgan from 'morgan';
import cors from 'cors';
import mongoose from 'mongoose';


const app = express();
const port = process.env.PORT || 7001;
const databaseName = 'thebridge';

import courseRoute from './routes/courseRoute.js';

mongoose.Promise = global.Promise;
mongoose.set('strictQuery', false);


//DATABASE
mongoose
  .connect(`mongodb://localhost:27017/${databaseName}`)
  .then(() => { // then ; une fois connecté afficher un msg de réussite sur la console
    console.log(`Connected to ${databaseName}`);
  })
  .catch(err => { // si erreur , affiche erreur sur console
    console.log(err);
  });



app.use(cors());
app.use(morgan("dev"));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use('/image', express.static('public/images'));
//routes
app.use('/course', courseRoute);
app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}/`);
  });