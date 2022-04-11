import * as React from "react";

function Form() {
  return <form className="row g-3">
    <div className="col-auto">
      <label htmlFor="inputPassword2" className="visually-hidden">Password</label>
      <input type="password" className="form-control" id="inputPassword2" placeholder="Password"/>
    </div>

    <div className="col-auto">
      <div className="input-group mb-3">
        <span className="input-group-text" id="basic-addon3">https://robohash.com/</span>
        <input type="text" className="form-control" id="basic-url" aria-describedby="basic-addon3"/>
      </div>
    </div>

    <div className="col-auto">
      <button type="submit" className="btn btn-primary mb-3">Add</button>
    </div>
  </form>;
}

function RoboList() {
  return <></>;
}

function Items() {
  return <div className="d-flex flex-column align-items-center mt-2">
    <Form />
    <RoboList />
  </div>;
}

export default Items;
