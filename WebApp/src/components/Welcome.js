import React from "react";
import "./Welcome.css"; // Import your CSS file for styling if necessary

const Welcome = () => {
  return (
    <div className="cover-page">
      <header>
        <nav>{/* Add your navigation links here */}</nav>
      </header>
      <main>
        <div className="cover-content">
          <h1 className="d-flex justify-content-center">Budget Buddy</h1>
          <p className="d-flex justify-content-center form-control z-depth-1 mb-4 pink-textarea active-pink-textarea-2">
            Everyday, users fall victim to not having enough money to cover a
            financial cost. Whether it’s for tuition or credit card bills,
            saving money is an important skill that everyone should develop.
            That’s why we created “Insert App name” here. Our goal is to help
            users manage their money more efficiently while educating them
            financially.
          </p>
        </div>
      </main>
      <footer>{/* Add footer content or links here */}</footer>
    </div>
  );
};

export default Welcome;
