/// <reference types="lucia" />
declare namespace Lucia {
	type Auth = import('./utils/auth.js').Auth;
	interface DatabaseUserAttributes { // provides types for createUser (options.attributes)
		name: string
		email: string
		created_at: number
	}
	interface DatabaseSessionAttributes { }
}
