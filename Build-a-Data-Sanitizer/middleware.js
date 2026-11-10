// build-a-data-sanitizer/middleware.js

const stripHtml = (str) => str.replace(/<[^>]*>?/gm, '');

const inputCleaner = (req, res, next) => {
  if (req.body && req.body.username) {
    req.body.username = req.body.username.toLowerCase();
  }
  if (req.body && req.body.comment) {
    req.body.comment = stripHtml(req.body.comment);
  }
  next();
};

const inputValidator = (req, res, next) => {
  if (req.body && req.body.username && req.body.username.length >= 3) {
    return next();
  }
  res.redirect('/form?error=Username must be at least 3 characters.');
};

module.exports = {
  inputCleaner,
  inputValidator,
};