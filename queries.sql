-- Task 4a: Selection - copies on shelf A
SELECT * FROM copy WHERE shelf_loc LIKE 'A%';

-- Task 4b: Projection - title and publication year
SELECT title, pub_year FROM book;

-- Task 4c: Composition - ISBN and shelf location for shelf B or later
SELECT isbn, shelf_loc FROM copy WHERE shelf_loc >= 'B';

-- Task 4d: Equi-Join - active loans with member name and book title
SELECT member.name, book.title
FROM loan
JOIN member ON loan.member_no = member.member_no
JOIN copy   ON loan.copy_no   = copy.copy_no
JOIN book   ON copy.isbn      = book.isbn
WHERE loan.return_date IS NULL;

-- Task 4e: Left Outer Join - all members and their active loan count
SELECT m.name, COUNT(l.loan_id) AS active_loans
FROM member AS m
LEFT OUTER JOIN loan AS l
    ON m.member_no = l.member_no
    AND l.return_date IS NULL
GROUP BY m.member_no, m.name;

-- Task 4f: Set Difference - books never borrowed
SELECT isbn FROM book
EXCEPT
SELECT isbn FROM copy JOIN loan ON copy.copy_no = loan.copy_no;
