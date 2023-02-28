<a name="readme-top"></a>

<div align="center">
  <img src="./vetlogo.PNG" alt="logo" width="256"  height="auto" />
  <br/>

  <h3><b>VET CLINIC</b></h3>

</div>


# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)


# 📖 Vet_Clinic <a name="about-project"></a>

**Vet_Clinic** is a relational database wich allows users to insert information about animals where they can include id, name, date of birth, escape attempts, weight ... etc, and all of this information is stored in a table that they can update or consult anytime.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

> This is a database project

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>


### Key Features <a name="key-features"></a>

- **Inside the database, there is a table called 'Animals' where information can be stored**
- **Users can update the information about any animal anytime**
- **Users can also search by specific information and all the data is going to be displayed according with the request**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database. **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

To get a local copy up and running, follow these steps.

### Prerequisites

- [ ] You’ll need to have PostgreSQL on your machine.

### Setup

To clone this repository to your desired folder:

- You can download the **Zip** file from the GitHub repository, or clone the repository with:

```console
git clone https://github.com/Juanpa8830/Vet-clinic-database.git
```

- Access the cloned directory with:

```console
cd Vet-clinic-database
```

- Open it with your favorite code editor or with the live server
### Install

To recreate the database use the following comand:

```console
psql -U username -f schema.sql
psql -U username -f data.sql
psql -U username -f queries.sql
```


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>


👤 **Juan Pablo Guerrero Rios**

- GitHub: [@Juanpa8830](https://github.com/Juanpa8830)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/juanpabloguerrerorios/)


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🔭 Future Features <a name="future-features"></a>


- [ ] **Add reserves and beauty services**


<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 🙏 Acknowledgments <a name="acknowledgements"></a>

- Thanks to my learning and coding partners for all their support.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
