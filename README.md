# SQL Database Interface with Node.js

This project enables interaction with a local SQL Server database through a user-friendly interface developed using HTML, CSS, and vanilla JavaScript. It leverages Node.js to establish connectivity between the interface and the SQL Server.

## Features

- **Database Connectivity**: Utilizes Node.js to connect and communicate with a local SQL Server.
- **Frontend Interface**: HTML, CSS, and vanilla JavaScript create a user interface for interacting with the database.
- **Package Dependencies**:
  - `express`: Enables building the server-side logic.
  - `mssql`: Provides the functionality to interact with Microsoft SQL Server.
  - `msnodesqlv8`: Allows Node.js to interface with SQL Server through Microsoft's OLE DB.

## Functionality

The interface offers the following functionalities:

- **Table Filtering**: Allows users to apply filters to a specific table within the connected database.
- **Custom SQL Queries**: Provides a text area for executing advanced SQL queries. Upon submission, the retrieved data is displayed in the interface.

## Getting Started

To set up and run this project locally, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-username/your-repo.git
2. **Install Dependencies**:
3. **Configure SQL Server Connection**:
   ```bash
   Modify the connection settings in config.js to match your local SQL Server configuration.
4. **Running the Application**:
   ```bash
   node app.js
6. Access the Interface
   ```bash
   Open a web browser and navigate to http://localhost:8000 to use the interface.
