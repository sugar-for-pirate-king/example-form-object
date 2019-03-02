# Experiment Form Object Pattern
Pattern ini biasanya digunakan jika anda memiliki form yang tidak memiliki table secara utuh, maksudnya dalam satu form, bisa saja *include* satu sampai dua table.

Di Rails, table (*database*) direpresentasikan dengan model, dan jika dalam form tersebut ada lebih dalam satu table/model dan model tersebut bisanya rails menyiapkan *callback* `accepts_nested_attributes_for` yang ditaruh di modelnya.

Namun jika *form logic* semakin kompleks, saya lebih menyarankan untuk menggunakan form object, karena membuat kodenya lebih *clean* dan meminimalisir *magic*-nya.

## Plan
Studi kasusnya kita akan membuat sebuah form yang melibatkan lebih dari satu model, karena jika hanya satu model saya menyarankan untuk sebisa mungkin gunakan *model object* saja.

Untuk formnya, kira-kira seperti ini, kita akan membuat registrasi form yang melibatkan object user dan *account*.
```
Name            : user.name
Phone Number    : user.phone_number
Bank Type       : account.id
Bank Number     : account.number
```
Khusus untuk bank type saya membuat `select_form` yang artinya user tinggal memilih type bank yang sudah didaftarkan sebelumnya.

Saya juga ingin membuat fitur edit form, agar kita bisa yakin bahwa form object bisa menggantikan object model secara utuh :smiley:.

Oke, kita sekarang merancang routes-nya.


