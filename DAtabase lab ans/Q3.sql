use pubs

CREATE PROCEDURE GetAuthorInfo
    @inputTitleID VARCHAR(20)
AS
BEGIN
    SELECT a.au_lname + ', ' + a.au_fname AS AuthorName, a.address AS AuthorAddress
    FROM authors a
    INNER JOIN titleauthor ta ON a.au_id = ta.au_id
    INNER JOIN titles t ON ta.title_id = t.title_id
    WHERE t.title_id = @inputTitleID;
END;

EXEC GetAuthorInfo 'I am a Noob';


