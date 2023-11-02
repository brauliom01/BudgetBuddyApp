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
        <h1 className="d-flex justify-content-center">How to save money</h1>
          <blockquote className="d-flex justify-content-center form-control z-depth-1 mb-4 pink-textarea active-pink-textarea-2">
            <p>Use money as a tool, not a goal.
            Before you begin planning, think about what you want to accomplish with your money. 
            Do you want to travel, start your own business, or champion an important social cause? 
            If those are priorities in your life, be sure to factor them into the equation.
            </p>
            <p>You are your greatest asset.
            At your age, your income potential, 
            the amount of money you will earn over the next 20 to 30 years, 
            is most likely your greatest asset. To protect this asset, 
            make sure you have good health, disability, and life insurance policies, all of which should be relatively inexpensive given your youth.

            </p>

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
