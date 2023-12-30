import express from "express";



import multerConfig from '../middlewares/multer-config.js';
import { addCourse, deleteCourse, getAllCourses, updateCourse } from "../controllers/courseController.js";
const router = express.Router();
//import upload from "../middlewares/uploads"


router.route("/addCourse").post(multerConfig, addCourse);
router.route("/getAllCourses").get(getAllCourses);
router.route("/deleteCourse/:id").delete(deleteCourse);
router.route("/updateCourse/:id").put(multerConfig,updateCourse);

export default router;