--【Question 1】

CREATE TABLE departments (
        -> department_id INT unsigned NOT NULL PRIMARY KEY AUTO_INCREMENT,
        -> name VARCHAR(20) NOT NULL,
        -> created_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
        -> updated_at TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
        -> );

--【Question 2】

ALTER TABLE people ADD department_id INT unsigned NULL AFTER email;


--【Question 3】

INSERT INTO departments (department_id, name) VALUE         --departmentテーブル
        ->(1, Sales)
        ->(2, Development)
        ->(3, Accounting)
        ->(4, Human Resources)
        ->(5, Information Systems)
        ;

        INSERT INTO reports (department_id, person_id name, email, age, gender) VALUE          --peopleテーブル
        ->(3, 12, 'Ali', 'ail@gizumo.jp', 48, 1)
        ->(2, 13, 'Hassan', 'hassan@gizumo.jp', 19, 1)
        ->(2, 14, 'Aisha', 'aisha@gizumo.jp', 27, 2)
        ->(5, 15, 'Maryam', 'maryam@gizumo.jp', 6, 2)
        ->(1, 16, 'Saeed', 'saeed@gizumo.jp', 91, 1)
        ->(4, 17, 'Amna', 'amna@gizumo.jp', 19, 2)
        ->(2, 18, 'Sara', 'Sara@gizumo.jp', 33, 2)
        ->(1, 19, 'Karim', 'karim@gizumo.jp', 64, 1)
        ->(2, 20, 'Ibrahim', 'ibrahim@gizumo.jp', 20, 1)
        ->(1, 21, 'Aya', 'aya@gizumo.jp', 76, 2)
        ;

    INSERT INTO reports (report_id, person_id, content) VALUES          --reportsテーブル
        ->(12, 12, 'Ana bikhayr aidan')
        ->(13, 13, 'Shukran jazeeran:)')
        ->(14, 14, 'Min ain anta?')
        ->(15, 15, 'Min al-Yaban')
        ->(16, 16, 'Wa anti? Min ayn anti?')
        ->(17, 17, 'Ana min faransa fii ouroba')
        ->(18, 18, 'Al-walad l-jamiil')
        ->(19, 19, 'Na3m hadhaa jamiil jiddan')
        ->(20, 20, 'Taskunii fii bariis?')
        ->(21, 21, 'Laa askun fii marsiliya')             --めちゃくちゃどうでもいいのですが書くことがなかったのでアラビア語会話をラテン文字表記してます
        ;


--【Question 4】

UPDATE people SET department_id = 4 WHERE person_id = 1;
UPDATE people SET department_id = 2 WHERE person_id = 2;
UPDATE people SET department_id = 5 WHERE person_id = 3;
UPDATE people SET department_id = 1 WHERE person_id = 4;
UPDATE people SET department_id = 4 WHERE person_id = 5;
UPDATE people SET department_id = 5 WHERE person_id = 6;
UPDATE people SET department_id = 3 WHERE person_id = 7;
UPDATE people SET department_id = 3 WHERE person_id = 8;
UPDATE people SET department_id = 2 WHERE person_id = 9;
UPDATE people SET department_id = 4 WHERE person_id = 10;
UPDATE people SET department_id = 3 WHERE person_id = 11;


--【Question 5】

SELECT name, age FROM people WHERE name = 1 ORDER BY age DESC;


--【Question 6】

SELECT
  `name`, `email`, `age`
FROM
  `people`
WHERE
  `department_id` = 1
ORDER BY
  `created_at`;

    /*
        peopleというテーブルから、名前、メールアドレス、年齢という３つのカラムを取得してください。
        その際、department_idというレコードの値が1（つまり営業部に所属している人）のデータを、作成された時間ごとに昇順で表示してください。
    */


--【Question 7】

SELECT name FROM people WHERE (age BETWEEN 20 AND 29 AND gender = 2) OR (age BETWEEN 40 AND 49 AND gender = 1)


--【Question 8】

SELECT age FROM people WHERE department_id =1 ORDER BY age;


--【Question 9】

SELECT AVG(age) AS average_age FROM people WHERE department_id = 2 AND gender = 2;


--【Question 10】

SELECT r.content AS content, d.name AS department_name, p.name AS name FROM reports r 
JOIN people p ON r.person_id = p.person_id JOIN departments d ON p.department_id = d.department_id;


--【Question 11】

SELECT p.name FROM people p LEFT JOIN reports r ON p.person_id = r.person_id WHERE r.report_id IS NULL;