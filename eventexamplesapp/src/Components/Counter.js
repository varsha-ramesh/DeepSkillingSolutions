import React, { Component } from 'react';

class Counter extends Component {
  constructor(props) {
    super(props);
    this.state = {
      count: 0
    };

    // Binding this for class methods
    this.increment = this.increment.bind(this);
    this.decrement = this.decrement.bind(this);
    this.sayHello = this.sayHello.bind(this);
  }

  increment() {
    this.setState({ count: this.state.count + 1 });
  }

  decrement() {
    this.setState({ count: this.state.count - 1 });
  }

  sayHello() {
    alert("Hello! This is a static message.");
  }

  // Method with parameter
  sayWelcome(message) {
    alert(message);
  }

  // Synthetic event
  handleClick(event) {
    alert("I was clicked!");
    console.log("Synthetic Event:", event); // React synthetic event
  }

  render() {
    return (
      <div style={{ marginBottom: "30px" }}>
        <h2>Counter: {this.state.count}</h2>

        {/* Increment button invokes multiple methods */}
        <button onClick={() => { this.increment(); this.sayHello(); }}>
          Increment
        </button>

        {/* Decrement button */}
        <button onClick={this.decrement}>
          Decrement
        </button>

        {/* Button that takes argument */}
        <button onClick={() => this.sayWelcome("Welcome to React Events!")}>
          Say Welcome
        </button>

        {/* Synthetic event */}
        <button onClick={(e) => this.handleClick(e)}>
          OnPress
        </button>
      </div>
    );
  }
}

export default Counter;
