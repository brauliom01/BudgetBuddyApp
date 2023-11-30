import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import Navbar from "../components/Navbar";
const About = () => {
  return (
    <>
      <Navbar />
      <div className="cover-page">
        <main>
          <div className="cover-content">
            <h1 className="d-flex justify-content-center">About Us</h1>
            <p className="d-flex justify-content-center form-control z-depth-1 mb-4 pink-textarea active-pink-textarea-2">
              Budget Buddy was created by David Solano, Braulio Martin, and
              Garret Feng. Our initial goals were to help develop an application
              that users can utilize to help save them money, educate them
              financially, and provide them with a reliable service that can
              advise them to be more mindful of their money.
            </p>
          </div>
        </main>
        <footer>{/*TODO: ADD Footer Page */}</footer>
      </div>
    </>
  );
};

export default About;
