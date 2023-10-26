import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";

import "./App.css";
import { AppProvider } from "./context/AppContext";

import Navbar from "./components/Navbar";
import Welcome from "./components/Welcome";
import Home from "./Home.js";
import Demo from "./pages/demo";
const App = () => {
  return (
    <AppProvider>
      <Router>
        <Routes>
          <Route path="/" element={<Home />} />
          <Route path="/demo" element={<Demo />} />
        </Routes>
      </Router>
    </AppProvider>
  );
};

export default App;
