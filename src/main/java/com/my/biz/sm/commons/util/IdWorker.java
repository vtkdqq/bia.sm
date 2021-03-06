package com.my.biz.sm.commons.util;

/**
 * 来自于twitter项目<a href="https://github.com/twitter/snowflake">snowflake</a>的id产生方案，全局唯一，时间有序
 * 
 * @author: smartlv
 * @date 2014年3月10日 上午9:50:29
 */
public class IdWorker
{
    private final long workerId;
    private final static long twepoch = 1303895660503L;
    private long sequence = 0L;
    // 机器标识位数
    private final static long workerIdBits = 10L;
    // 机器ID最大值
    private final static long maxWorkerId = -1L ^ -1L << workerIdBits;
    private final static long sequenceBits = 12L;

    private final static long workerIdShift = sequenceBits;
    private final static long timestampLeftShift = sequenceBits + workerIdBits;
    private final static long sequenceMask = -1L ^ -1L << sequenceBits;

    private long lastTimestamp = -1L;

    public IdWorker(final long workerId)
    {
        super();
        if (workerId > maxWorkerId || workerId < 0)
        {
            throw new IllegalArgumentException(String.format("worker Id can't be greater than %d or less than 0",
                    IdWorker.maxWorkerId));
        }
        this.workerId = workerId;
    }

    public synchronized long nextId()
    {
        long timestamp = this.timeGen();
        if (this.lastTimestamp == timestamp)
        {
            this.sequence = this.sequence + 1 & IdWorker.sequenceMask;
            if (this.sequence == 0)
            {
                timestamp = this.tilNextMillis(this.lastTimestamp);
            }
        }
        else
        {
            this.sequence = 0;
        }
        if (timestamp < this.lastTimestamp)
        {
            throw new RuntimeException(String.format(
                    "Clock moved backwards.  Refusing to generate id for %d milliseconds", this.lastTimestamp
                            - timestamp));
        }

        this.lastTimestamp = timestamp;
        return timestamp - twepoch << IdWorker.timestampLeftShift | this.workerId << IdWorker.workerIdShift
                | this.sequence;
    }

    private long tilNextMillis(final long lastTimestamp)
    {
        long timestamp = this.timeGen();
        while (timestamp <= lastTimestamp)
        {
            timestamp = this.timeGen();
        }
        return timestamp;
    }

    private long timeGen()
    {
        return System.nanoTime() / 1000000;
    }

    public static void main(String[] args)
    {
        IdWorker id = new IdWorker(1);
        for (int i = 0; i < 100; i++)
        {
            System.out.println(-id.nextId());
        }

    }
}
