-- ==========================================
-- 3.2. B. Produit cartésien
-- ==========================================
SELECT * 
FROM equipes CROSS JOIN continent;

-- ==========================================
-- 3.3. C. Jointure interne
-- ==========================================
-- C.1
SELECT j.nom_joueur, e.nom_equipe
FROM joueurs j
JOIN equipes e ON j.fk_id_equipe = e.id_equipe;

-- C.2
SELECT e.nom_equipe, p.nom_pays
FROM equipes e
JOIN pays p ON e.fk_id_pays = p.id_pays;

-- C.3
SELECT j.nom_joueur, p.nom_pays, e.nom_equipe
FROM joueurs j
JOIN equipes e ON j.fk_id_equipe = e.id_equipe
JOIN pays p ON e.fk_id_pays = p.id_pays;

-- C.4
SELECT m.date_match, el.nom_equipe AS equipe_locale, ev.nom_equipe AS equipe_visiteuse
FROM matches m
JOIN equipes el ON m.fk_id_equipe_local = el.id_equipe
JOIN equipes ev ON m.fk_id_equipe_visite = ev.id_equipe;

-- ==========================================
-- 3.4. D. Jointure externe gauche (LEFT)
-- ==========================================
-- D.1
SELECT j.nom_joueur, e.nom_equipe
FROM joueurs j
LEFT JOIN equipes e ON j.fk_id_equipe = e.id_equipe;

-- D.2
SELECT c.nom_continent, p.nom_pays
FROM continent c
LEFT JOIN pays p ON c.id_continent = p.fk_id_continent;

-- ==========================================
-- 3.5. E. Anti-jointure
-- ==========================================
-- E.1
SELECT j.nom_joueur
FROM joueurs j
LEFT JOIN equipes e ON j.fk_id_equipe = e.id_equipe
WHERE e.id_equipe IS NULL;

-- E.2
SELECT c.nom_continent
FROM continent c
LEFT JOIN pays p ON c.id_continent = p.fk_id_continent
WHERE p.id_pays IS NULL;

-- E.3
SELECT p.nom_pays
FROM pays p
LEFT JOIN equipes e ON p.id_pays = e.fk_id_pays
WHERE e.id_equipe IS NULL;