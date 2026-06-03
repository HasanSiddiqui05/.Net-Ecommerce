# 🛒 E-Commerce Web Application

A full-featured e-commerce web application built with **C# (ASP.NET)** following a **Layered / N-Tier Architecture**. 
---

## 👥 Team

| Name | Enrollment # |
|---|---|
| Muhammad Uzair Naseem | 02-131222-045 |
| Hasan Shahab | 02-131222-059 |
| Abdullah Hussain | 02-131222-086 |

**Course:** SEL 221 – Software Design and Architecture  
**Class:** BSE – 4A (Spring 2024)  
**Department:** Software Engineering, Bahria University (Karachi Campus)

---

## 📌 Overview

This project delivers a robust and scalable online shopping platform that allows customers to browse products, manage their cart, and complete secure transactions. An administrative dashboard provides tools for managing products, orders, and user accounts.

The application is built on an N-Tier architecture to ensure **separation of concerns**, **scalability**, and **maintainability**.

---

## ✨ Features

- **Product Catalog** – Browse products with advanced search and filtering by category, price range, and brand
- **Product Details** – High-quality images, descriptions, specifications, reviews, and ratings
- **Shopping Cart** – Add, remove, and update items with real-time price calculations
- **User Authentication** – Secure account creation, login, and profile management
- **Order Management** – Real-time order tracking with history and status updates
- **Admin Dashboard** – Manage products, categories, inventory, and user accounts

---

## 🏗️ Architecture

The application follows a **3-Layer / N-Tier Architecture**:

```
┌──────────────────────────┐
│     Presentation Layer    │  ← UI rendering, user interaction
├──────────────────────────┤
│   Business Logic Layer    │  ← Core rules, validation, product logic
├──────────────────────────┤
│    Data Access Layer      │  ← Database operations, data persistence
└──────────────────────────┘
```

---

## 🎨 Design Pattern

The checkout flow uses the **Chain of Responsibility** pattern, processing each step (cart validation → address validation → payment) through a chain of handlers.

```csharp
public interface ICheckoutHandler
{
    void HandleRequest(CheckoutContext context);
    ICheckoutHandler SetNext(ICheckoutHandler nextHandler);
}
```

Handler chain: `CartHandler` → `AddressHandler` → `PaymentHandler`

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Backend | C# / ASP.NET |
| Database | Microsoft SQL Server |
| Architecture | N-Tier / Layered |
| Design Pattern | Chain of Responsibility |

---

## ⚙️ Prerequisites

- .NET SDK (compatible with ASP.NET)
- Microsoft SQL Server
- Visual Studio or VS Code with C# extension
- Stable internet connection (for external services)

---

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/your-repo-name.git
   cd your-repo-name
   ```

2. **Set up the database**  
   Configure your SQL Server connection string in `appsettings.json`.

3. **Restore dependencies**
   ```bash
   dotnet restore
   ```

4. **Run the application**
   ```bash
   dotnet run
   ```

---

## 📁 Project Files

Full project source code is available on Google Drive:  
🔗 [Project Drive Link](https://drive.google.com/drive/folders/1d2A7b1pzHddQsxPpio3KaTCRSbCqyF4g?usp=drive_link)

---

## 📄 License

This project was created for academic purposes at Bahria University.
