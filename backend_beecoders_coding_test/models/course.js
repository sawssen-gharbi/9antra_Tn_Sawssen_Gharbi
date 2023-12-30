import mongoose from 'mongoose';
const { Schema, model } = mongoose;

const CourseSchema = new Schema({
    title: {
        type: String
    },
    price :{
        type: String
    },
    image: {
        type: String,
    }
 
},
    {
        timestamp: true
    }
);

export default mongoose.model('course', CourseSchema);