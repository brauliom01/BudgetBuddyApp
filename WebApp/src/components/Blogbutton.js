import React from "react";

const Blogbutton = (props) => {
  return (
    <>
      <button
        type="button"
        class="btn btn-primary"
        onClick={props.handleEditClick}
      >
        Blog
      </button>
    </>
  );
};

export default Blogbutton;