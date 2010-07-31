/*

 $Id: $

*/

BEGIN;

/*
	Domain definition
*/
/*
CREATE DOMAIN varchar_ci AS varchar(255) NOT NULL DEFAULT ''::character varying;
*/
/*
	Operation Functions
*/
/*
CREATE FUNCTION _varchar_ci_equal(varchar_ci, varchar_ci) RETURNS boolean AS 'SELECT LOWER($1) = LOWER($2)' LANGUAGE SQL STRICT;
CREATE FUNCTION _varchar_ci_not_equal(varchar_ci, varchar_ci) RETURNS boolean AS 'SELECT LOWER($1) != LOWER($2)' LANGUAGE SQL STRICT;
CREATE FUNCTION _varchar_ci_less_than(varchar_ci, varchar_ci) RETURNS boolean AS 'SELECT LOWER($1) < LOWER($2)' LANGUAGE SQL STRICT;
CREATE FUNCTION _varchar_ci_less_equal(varchar_ci, varchar_ci) RETURNS boolean AS 'SELECT LOWER($1) <= LOWER($2)' LANGUAGE SQL STRICT;
CREATE FUNCTION _varchar_ci_greater_than(varchar_ci, varchar_ci) RETURNS boolean AS 'SELECT LOWER($1) > LOWER($2)' LANGUAGE SQL STRICT;
CREATE FUNCTION _varchar_ci_greater_equals(varchar_ci, varchar_ci) RETURNS boolean AS 'SELECT LOWER($1) >= LOWER($2)' LANGUAGE SQL STRICT;
*/
/*
	Operators
*/
/*
CREATE OPERATOR <(
  PROCEDURE = _varchar_ci_less_than,
  LEFTARG = varchar_ci,
  RIGHTARG = varchar_ci,
  COMMUTATOR = >,
  NEGATOR = >=,
  RESTRICT = scalarltsel,
  JOIN = scalarltjoinsel);

CREATE OPERATOR <=(
  PROCEDURE = _varchar_ci_less_equal,
  LEFTARG = varchar_ci,
  RIGHTARG = varchar_ci,
  COMMUTATOR = >=,
  NEGATOR = >,
  RESTRICT = scalarltsel,
  JOIN = scalarltjoinsel);

CREATE OPERATOR >(
  PROCEDURE = _varchar_ci_greater_than,
  LEFTARG = varchar_ci,
  RIGHTARG = varchar_ci,
  COMMUTATOR = <,
  NEGATOR = <=,
  RESTRICT = scalargtsel,
  JOIN = scalargtjoinsel);

CREATE OPERATOR >=(
  PROCEDURE = _varchar_ci_greater_equals,
  LEFTARG = varchar_ci,
  RIGHTARG = varchar_ci,
  COMMUTATOR = <=,
  NEGATOR = <,
  RESTRICT = scalargtsel,
  JOIN = scalargtjoinsel);

CREATE OPERATOR <>(
  PROCEDURE = _varchar_ci_not_equal,
  LEFTARG = varchar_ci,
  RIGHTARG = varchar_ci,
  COMMUTATOR = <>,
  NEGATOR = =,
  RESTRICT = neqsel,
  JOIN = neqjoinsel);

CREATE OPERATOR =(
  PROCEDURE = _varchar_ci_equal,
  LEFTARG = varchar_ci,
  RIGHTARG = varchar_ci,
  COMMUTATOR = =,
  NEGATOR = <>,
  RESTRICT = eqsel,
  JOIN = eqjoinsel,
  HASHES,
  MERGES,
  SORT1= <);
*/
/*
	Table: 'phpbb_tracker_project_categories'
*/
CREATE SEQUENCE phpbb_tracker_project_categories_seq;

CREATE TABLE phpbb_tracker_project_categories (
	project_cat_id INT4 DEFAULT nextval('phpbb_tracker_project_categories_seq'),
	project_name varchar(255) DEFAULT '' NOT NULL,
	project_name_clean varchar(255) DEFAULT '' NOT NULL,
	PRIMARY KEY (project_cat_id)
);


/*
	Table: 'phpbb_tracker_project_watch'
*/
CREATE TABLE phpbb_tracker_project_watch (
	user_id INT4 DEFAULT '0' NOT NULL CHECK (user_id >= 0),
	project_id INT4 DEFAULT '0' NOT NULL CHECK (project_id >= 0),
	PRIMARY KEY (user_id, project_id)
);


/*
	Table: 'phpbb_tracker_tickets_watch'
*/
CREATE TABLE phpbb_tracker_tickets_watch (
	user_id INT4 DEFAULT '0' NOT NULL CHECK (user_id >= 0),
	ticket_id INT4 DEFAULT '0' NOT NULL CHECK (ticket_id >= 0),
	PRIMARY KEY (user_id, ticket_id)
);



COMMIT;