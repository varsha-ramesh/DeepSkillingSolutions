import React from 'react';

function OfficeList() {
  // Single office object
  const office = {
    name: 'Tech Park',
    rent: 75000,
    address: 'MG Road, Bangalore'
  };

  // List of office spaces
  const offices = [
    { name: 'Innovation Hub', rent: 50000, address: 'Whitefield, Bangalore' },
    { name: 'Business Center', rent: 85000, address: 'Koramangala, Bangalore' },
    { name: 'Startup Space', rent: 60000, address: 'HSR Layout, Bangalore' }
  ];

  return (
    <div style={{ padding: '20px', fontFamily: 'Arial' }}>
      {/* Heading */}
      <h1>Office Space Rental</h1>

      {/* Display Image */}
      <img
        src="/360_F_384552930_zPoe9zgmCF7qgt8fqSedcyJ6C6Ye3dFs.jpg"
        alt="Office Space"
        style={{ width: '400px', height: '200px', marginBottom: '20px', borderRadius: '10px' }}
      />

      {/* Display single office */}
      <h2>{office.name}</h2>
      <p>
        Rent:{" "}
        <span style={{ color: office.rent < 60000 ? 'red' : 'green', fontWeight: 'bold' }}>
          ₹{office.rent}
        </span>
      </p>
      <p>Address: {office.address}</p>

      {/* Display multiple offices */}
      <h2>Available Office Spaces</h2>
      <ul>
        {offices.map((item, index) => (
          <li key={index} style={{ marginBottom: '10px' }}>
            <strong>{item.name}</strong> - 
            <span style={{ color: item.rent < 60000 ? 'red' : 'green', fontWeight: 'bold' }}>
              ₹{item.rent}
            </span> 
            ({item.address})
          </li>
        ))}
      </ul>
    </div>
  );
}

export default OfficeList;
