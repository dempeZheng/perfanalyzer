# 统计DISK使用，查找最大DISKREAD, DISKWRITE DISKBUSY
for i in `cat analyse/testcase`;do
	nmon=`find $i -name zqueue*nmon`
	w=`fgrep DISKWRITE $nmon | fgrep -v Write| cut -d',' -f3 | sort -n | tail -1`
	r=`fgrep DISKREAD $nmon | fgrep -v Read| cut -d',' -f3 | sort -n | tail -1`
	b=`fgrep DISKBUSY $nmon | fgrep -v Busy| cut -d',' -f3 | sort -n | tail -1`
	echo $r/$w/$b
done;
