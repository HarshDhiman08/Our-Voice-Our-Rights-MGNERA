# 🇮🇳 Our Voice, Our Rights — MGNREGA Insights App

A **Flutter-based mobile application** that visualizes **real-time and historical performance** of districts in the **Mahatma Gandhi National Rural Employment Guarantee Act (MGNREGA)** scheme.  

This app empowers citizens to **understand district-level welfare data visually** through charts, summaries, and easy-to-read statistics, without requiring technical expertise.

---

## 📖 Project Overview

MGNREGA is one of the **largest welfare programs in the world**, providing guaranteed employment to rural households. In 2025 alone, **12.15 crore rural Indians** benefitted from this program.  

Although the data is available via [data.gov.in](https://www.data.gov.in/catalog/mahatma-gandhi-national-rural-employment-guarantee-act-mgnrega) APIs, it is **not accessible to the general public** without technical knowledge.  

This app bridges that gap by:

- Providing **interactive visualizations** of MGNREGA data.
- Allowing citizens to **view current and historical district performance**.
- Enabling **state and year selection** for comparative insights.

---

## ✨ Features

- **District-Level Insights**
  - View key MGNREGA metrics for any district and month:
    - Households Worked
    - Persondays Generated
    - Women Participation Rate
    - SC/ST Workers and Persondays
    - Total Expenditure
    - Completed and Ongoing Works

- **Interactive Charts**
  - Bar charts and summary cards for persondays and expenditure.
  - Visual representation of women participation and other categories.

- **State & Year Filters**
  - Dynamic selection of **state and financial year** to filter data.

- **Historical & Comparative Data**
  - Compare district performance over multiple years.

- **Offline/Resilient Design**
  - Caching and error handling for API failures (planned for production readiness).

- **Clean, Responsive UI**
  - Material Design components with Google Fonts.
  - Works seamlessly on Android, iOS, and Flutter Web.

---

## 🧩 Tech Stack

| Layer               | Technology                                 |
|--------------------|-------------------------------------------|
| Frontend           | Flutter (Dart)                             |
| State Management   | Provider                                   |
| Charts             | fl_chart                                   |
| Fonts              | Google Fonts                               |
| API Source         | [data.gov.in MGNREGA API](https://data.gov.in/catalog/mahatma-gandhi-national-rural-employment-guarantee-act-mgnrega) |

---

## 📂 Folder Structure

