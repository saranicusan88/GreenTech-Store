# 🌱 GreenTechStore

**GreenTechStore** este o aplicație Java desktop (Swing) pentru gestionarea și vânzarea de produse eco.

Aplicația oferă atât o interfață pentru clienți, cât și o consolă pentru angajați (ADMIN / EMPLOYEE), fiind conectată la o bază de date SQL Server.

---

## ✨ Funcționalități principale

### 👤 Client
- Căutare produse eco
- Vizualizare detalii produs (preț, stoc, eco score, CO₂ salvat)
- Cumpărare produs (actualizare stoc)
- Vizualizare **istoric comenzi** pe baza adresei de email

### 👨‍💼 Angajat
- Login securizat
- Vizualizare produse
- Update stoc și preț
- Adăugare / ștergere produse (ADMIN)
- Rapoarte produse și vânzări

---

## ▶️ Rulare aplicație

1. Rulați scriptul **`GreenTechStore_.sql`** în **SQL Server Management Studio (SSMS)**  
2. Deschideți proiectul Java în **IntelliJ IDEA**  
3. Modificați în codul de conexiune (`Db.java`):
   - server: `localhost`
   - baza de date: `GreenTechStore`
   - user / parola SQL
   (employee: emp01@greentech.local, parola: Parola123!)
   (admin: admin@greentech.local, parola: Admin123!)
4. Rulați clasa **`Main`**

---

## 🛠️ Tehnologii utilizate
- Java Swing
- JDBC
- SQL Server
- DAO Pattern
- MVC (Model–View–Controller)



## 📸 Capturi ecran

### Ecran principal
![Ecran principal](screenshots/home.png)

### Panou cumparator
![Ecran principal](screenshots/customer.png)

### Căutare produse
![Căutare produse](screenshots/search.png)

### Panou angajat
![Panou angajat](screenshots/employee.png)

### Panou admin
![Panou angajat](screenshots/admin.png)


