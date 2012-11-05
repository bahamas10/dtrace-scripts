#!/usr/sbin/dtrace -s
/**
 * Look up top syscalls by pid
 */

#pragma D option quiet

BEGIN
{
	trace("Tracing...\n");
}

syscall:::entry
/pid == $target/
{
	self->start = timestamp;
}

syscall:::return
/self->start/
{
	this->delta = timestamp - self->start;
	@t[probefunc] = sum(this->delta);
	@c[probefunc] = count();
	self->start = 0;
}

END
{
	trunc(@t, 10);
	trunc(@c, 10);
	printf("Top 10 Count:");
	printa(@c);
	printf("Top 10 Total (ns):");
	printa(@t);
}
