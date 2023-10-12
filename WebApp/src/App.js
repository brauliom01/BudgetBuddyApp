import React from "react";
import "bootstrap/dist/css/bootstrap.min.css";

import "./App.css";
import { AppProvider } from "./context/AppContext";
import Budget from "./components/Budget";
import ExpenseTotal from "./components/ExpenseTotal";
import ExpenseList from "./components/ExpenseList";
import AddExpenseForm from "./components/AddExpenseForm";
import RemainingBudget from "./components/Remaining";
<<<<<<< Updated upstream
import Navbar from "./components/Navbar";
import Welcome from "./components/Welcome";
=======
import Blogbutton from "./components/Blogbutton";
>>>>>>> Stashed changes

const App = () => {
  return (
    <AppProvider>
      <Navbar />
      <Welcome />
      <div className="container">
<<<<<<< HEAD
<<<<<<< Updated upstream
        <Welcome />
=======
>>>>>>> 8f1886e5be086cde681c03a037ab34abc9bf4731
        <h1 className="mt-3 fw-normal">Budget Buddy Demo</h1>
=======
        <h1 className="mt-8">Budget Buddy</h1>
>>>>>>> Stashed changes
        <div className="row mt-3">
          <div className="col-sm">
            <Budget />
          </div> 
          <div className="col-sm">
            <RemainingBudget />
          </div>
          <div className="col-sm">
            <ExpenseTotal />
          </div>
          <div className="col-sm">
            <Blogbutton />
          </div>
        </div>
        <h3 className="mt-3">Expenses</h3>
        <div className="row ">
          <div className="col-sm">
            <ExpenseList />
          </div>
        </div>
        <h3 className="mt-3">Add Expense</h3>
        <div className="row mt-3">
          <div className="col-sm">
            <AddExpenseForm />
          </div>
        </div>
      </div>
    </AppProvider>
  );
};

export default App;
