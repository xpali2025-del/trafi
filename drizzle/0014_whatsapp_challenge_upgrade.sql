ALTER TABLE "store"."login_challenges" ADD COLUMN "purpose" "store"."otp_purpose" DEFAULT 'login' NOT NULL;--> statement-breakpoint
ALTER TABLE "store"."login_challenges" ADD COLUMN "customer_id" uuid;--> statement-breakpoint
ALTER TABLE "store"."login_challenges" ADD COLUMN "target_phone" text;--> statement-breakpoint
ALTER TABLE "store"."login_challenges" ADD COLUMN "rejected_at" timestamp with time zone;--> statement-breakpoint
ALTER TABLE "store"."login_challenges" ADD COLUMN "rejected_by" text;--> statement-breakpoint
ALTER TABLE "store"."login_challenges" ADD COLUMN "rejection_reason" text;--> statement-breakpoint
ALTER TABLE "store"."login_challenges" ADD CONSTRAINT "login_challenges_change_phone_target" CHECK (("store"."login_challenges"."purpose" = 'login' OR ("store"."login_challenges"."purpose" = 'change_phone' AND "store"."login_challenges"."customer_id" IS NOT NULL AND "store"."login_challenges"."target_phone" IS NOT NULL)));--> statement-breakpoint
ALTER TABLE "store"."login_challenges" ADD CONSTRAINT "login_challenges_customer_id_customers_id_fk" FOREIGN KEY ("customer_id") REFERENCES "store"."customers"("id") ON DELETE cascade ON UPDATE no action;--> statement-breakpoint
CREATE INDEX "login_challenges_created_idx" ON "store"."login_challenges" USING btree ("created_at" DESC);
