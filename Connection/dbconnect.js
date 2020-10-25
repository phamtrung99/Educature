const mysql = require('../node_modules/mysql');

function createCon() {
	// return mysql.createConnection({
	// 	host: "localhost",
	// 	user: "root",
	// 	password: "1234",
	// 	database: "elearning"
	// });

	// 	return mysql.createConnection({
	// 	host: "sql12.freemysqlhosting.net",
	// 	user: "sql12329336",
	// 	password: "JXn57vSTQF",
	// 	database: "sql12329336"
	// });

	return mysql.createConnection({
		host: "bllkv86pud8ndgooovt7-mysql.services.clever-cloud.com",
		user: "uxemzrtfn1rnxnnc",
		password: "0za6HGlPfPlyUA2b0ipK",
		database: "bllkv86pud8ndgooovt7"
	});

}

module.exports = {
	load: (query) => {
		return new Promise((resole, reject) => {
			const con = createCon();

			con.connect(err => {
				if (err) {
					reject(err);
				}
			});

			con.query(query, (error, results, fields) => {
				if (error) {
					reject(error);
				}
				resole(results);
			});

			con.end();
		});
	}
};