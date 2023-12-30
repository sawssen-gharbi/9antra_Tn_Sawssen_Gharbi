import multer, { diskStorage } from "multer";
import { join, dirname } from "path";
import { fileURLToPath } from "url";

const MIME_TYPES = {
    'image/jpg': 'jpg',
    'image/jpeg': 'jpeg',
    'image/png': 'png',

}

export default multer({
    storage: diskStorage({
        destination: (req, file, callback) => {
            const _dirname = dirname(fileURLToPath(import.meta.url));
            callback(null, join(_dirname, "../public/images"));
        },
        filename: function (req, file, cb) {
            let ext = file.originalname.substring(file.originalname.lastIndexOf('.'), file.originalname.length);
            cb(null, Date.now() + ext)}
        }),

    limits: {
        fileSize: 10 * 1024 * 1024,
    },
}).single("image");
