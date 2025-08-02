import React, { Component } from 'react';

class CurrencyConvertor extends Component {
  constructor(props) {
    super(props);
    this.state = {
      rupees: '',
      euro: ''
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ rupees: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    const euroValue = (this.state.rupees / 90).toFixed(2); // Example: 1 Euro = 90 INR
    this.setState({ euro: euroValue });
  }

  render() {
    return (
      <div>
        <h2>Currency Converter</h2>
        <form onSubmit={this.handleSubmit}>
          <label>Enter Rupees: </label>
          <input
            type="number"
            value={this.state.rupees}
            onChange={this.handleChange}
          />
          <button type="submit">Convert</button>
        </form>
        {this.state.euro && (
          <h3>{this.state.rupees} INR = {this.state.euro} EUR</h3>
        )}
      </div>
    );
  }
}

export default CurrencyConvertor;
