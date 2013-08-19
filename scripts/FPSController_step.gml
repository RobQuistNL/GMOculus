if smoothing_enabled{
    delta = 60/1000000*delta_time;
    smooth_factora += delta;
}
