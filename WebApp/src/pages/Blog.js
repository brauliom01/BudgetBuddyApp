import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Navbar from "../components/Navbar";

const Blog = () => {
  return (
    <>
      <Navbar />
      <div className="container">
        <h1>Working title for blog</h1>
        <h1 className="mt-3 fw-normal">First blog post 10/4/2024</h1>
        <button type="button">Click here</button>
        <figure className="text-center">
          <blockquote className="blockquote">
            <p>
              This is just for testing purposes. In the meantime, start saving
              money today with budget buddy!
            </p>
          </blockquote>
        </figure>

        <h1 className="mt-3 fw-normal">Test blog post 10/9/2024</h1>
        <figure className="text-center">
          <blockquote className="blockquote">
            <p>Eliminate Your Debt. ...</p>
            <p>Set Savings Goals. ...</p>
            <p>Pay Yourself First. ...</p>
            <p>Stop Smoking. ...</p>
            <p>Take a Staycation. ...</p>
            <p>Spend to Save. ...</p>
            <p>Utility Savings. ...</p>
            <p>Pack Your Lunch...</p>
          </blockquote>
        </figure>
      </div>
    </>
  );
};

export default Blog;

// export default blogtest;
// <DOCTYPE! html>

// <html>
//   <head>
//     <script src="js/script.js"></script>

//   </head>
//   <body>
//   </body>

// </html>
