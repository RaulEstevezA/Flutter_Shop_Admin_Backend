"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.fileNamer = void 0;
const uuid_1 = require("uuid");
const fileNamer = (req, file, callback) => {
    if (!file)
        return callback(new Error('File is empty'), false);
    const fileParts = file.originalname.split('.');
    const fileExtension = fileParts[fileParts.length - 1];
    const fileExtensionMipetype = file.mimetype.split('/')[1];
    const extension = (fileExtension) ? fileExtension : fileExtensionMipetype;
    const fileName = `${(0, uuid_1.v4)()}.${extension}`;
    callback(null, fileName);
};
exports.fileNamer = fileNamer;
//# sourceMappingURL=fileNamer.helper.js.map