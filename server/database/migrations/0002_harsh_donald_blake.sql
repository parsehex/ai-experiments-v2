CREATE TABLE IF NOT EXISTS "llm_role" (
	"id" varchar PRIMARY KEY NOT NULL,
	"created_at" bigint NOT NULL,
	"user_id" varchar NOT NULL,
	"name" varchar NOT NULL,
	"label" varchar NOT NULL,
	"description" varchar NOT NULL,
	"pic" varchar NOT NULL,
	"visibility" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "llm_role_version" (
	"id" varchar PRIMARY KEY NOT NULL,
	"created_at" bigint NOT NULL,
	"role_id" varchar NOT NULL,
	"instructions" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "thread" (
	"id" varchar PRIMARY KEY NOT NULL,
	"created_at" bigint NOT NULL,
	"updated_at" bigint NOT NULL,
	"user_id" varchar NOT NULL,
	"title" varchar NOT NULL,
	"role_id" varchar,
	"role_verion_id" varchar,
	"folder_id" varchar
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "thread_folder" (
	"id" varchar PRIMARY KEY NOT NULL,
	"created_at" bigint NOT NULL,
	"user_id" varchar NOT NULL,
	"name" varchar NOT NULL
);
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "thread_message" (
	"id" varchar PRIMARY KEY NOT NULL,
	"created_at" bigint NOT NULL,
	"thread_id" varchar NOT NULL,
	"role" varchar NOT NULL,
	"content" varchar NOT NULL
);
--> statement-breakpoint
ALTER TABLE "user_key" DROP CONSTRAINT "user_key_user_id_auth_user_id_fk";
--> statement-breakpoint
ALTER TABLE "org_invitation" DROP CONSTRAINT "org_invitation_org_id_org_id_fk";
--> statement-breakpoint
ALTER TABLE "org_member" DROP CONSTRAINT "org_member_user_id_auth_user_id_fk";
--> statement-breakpoint
ALTER TABLE "user_session" DROP CONSTRAINT "user_session_user_id_auth_user_id_fk";
--> statement-breakpoint
ALTER TABLE "stripe_customer" DROP CONSTRAINT "stripe_customer_org_id_org_id_fk";
--> statement-breakpoint
ALTER TABLE "stripe_subscription" DROP CONSTRAINT "stripe_subscription_org_id_org_id_fk";
--> statement-breakpoint
ALTER TABLE "auth_user" ADD COLUMN "created_at" bigint;--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_key" ADD CONSTRAINT "user_key_user_id_auth_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "org_invitation" ADD CONSTRAINT "org_invitation_org_id_org_id_fk" FOREIGN KEY ("org_id") REFERENCES "org"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "org_member" ADD CONSTRAINT "org_member_user_id_auth_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "user_session" ADD CONSTRAINT "user_session_user_id_auth_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "stripe_customer" ADD CONSTRAINT "stripe_customer_org_id_org_id_fk" FOREIGN KEY ("org_id") REFERENCES "org"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "stripe_subscription" ADD CONSTRAINT "stripe_subscription_org_id_org_id_fk" FOREIGN KEY ("org_id") REFERENCES "org"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "llm_role" ADD CONSTRAINT "llm_role_user_id_auth_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "llm_role_version" ADD CONSTRAINT "llm_role_version_role_id_llm_role_id_fk" FOREIGN KEY ("role_id") REFERENCES "llm_role"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "thread" ADD CONSTRAINT "thread_user_id_auth_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "thread" ADD CONSTRAINT "thread_role_id_llm_role_id_fk" FOREIGN KEY ("role_id") REFERENCES "llm_role"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "thread" ADD CONSTRAINT "thread_role_verion_id_llm_role_version_id_fk" FOREIGN KEY ("role_verion_id") REFERENCES "llm_role_version"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "thread" ADD CONSTRAINT "thread_folder_id_thread_folder_id_fk" FOREIGN KEY ("folder_id") REFERENCES "thread_folder"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "thread_folder" ADD CONSTRAINT "thread_folder_user_id_auth_user_id_fk" FOREIGN KEY ("user_id") REFERENCES "auth_user"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "thread_message" ADD CONSTRAINT "thread_message_thread_id_thread_id_fk" FOREIGN KEY ("thread_id") REFERENCES "thread"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
