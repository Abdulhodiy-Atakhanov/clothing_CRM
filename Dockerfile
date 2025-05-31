# Python 3.11 asosidagi rasm
FROM python:3.11-slim

# Ishchi katalog
WORKDIR /app

# Talablar faylini nusxalash
COPY requirements.txt .

# Kutubxonalarni o‘rnatish
RUN pip install --upgrade pip && pip install -r requirements.txt

# Loyiha fayllarini konteynerga nusxalash
COPY . .

# Django static fayllarini yig‘ish
RUN python manage.py collectstatic --noinput

# Port ochish (faqat ko‘rsatish uchun, sqlite bo‘lgani uchun bu shart emas)
EXPOSE 8000

# Django serverni ishga tushirish
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]