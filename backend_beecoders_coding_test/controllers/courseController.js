import course from "../models/course.js";


export async function addCourse(req, res) {
    const verifCourse = await course.findOne({ title: req.body.title });
    if (verifCourse) {
      console.log("course already exists");
      res.status(403).send({ message: "Course already exists !" });
    } else {
      
      const newCourse = new course({
        title: req.body.title,
        price: req.body.price,
        image: `${req.protocol}://${req.get("host")}/image/${req.file.filename}` 
      });
  
      try {
        await newCourse.save();
        res.status(201).send({ message: "Success : Course saved with success", course: newCourse });
      } catch (err) {
        console.log(err);
        res.status(500).send({ message: "Error while saving course" });
      }
    }
  }



  //get all courses 
export async function getAllCourses(req, res) {
    const courses = await course.find();

    if (courses) {
        res.status(200).send({ courses });
    } else {
        res.status(403).send({ message: "Fail : No Courses" });
    }
};


//delete a course

export async function deleteCourse(req,res){
  const deletedCourse = await course.findByIdAndDelete({_id:req.params.id});
  if(deletedCourse) {
    res.status(200).json({message: "Course deleted!"});
  }  else {
    res.status(403).send({ message: "Fail" });
}
};

    
 //update Course
 export async function updateCourse(req, res) {
  const courseId = req.params.id;

  try {
    const existingCourse = await course.findById(courseId);

    if (!existingCourse) {
      return res.status(404).json({ message: "Course not found" });
    }

   
    existingCourse.title = req.body.title || existingCourse.title;
    existingCourse.price = req.body.price || existingCourse.price;


    if (req.file) {
      existingCourse.image = `${req.protocol}://${req.get("host")}/image/${req.file.filename}`;
    }

    await existingCourse.save();

    res.status(200).json({ message: "Course updated successfully", course: existingCourse });
  } catch (error) {
    console.log(error);
    res.status(500).json({ message: "Error while updating course" });
  }
}

  